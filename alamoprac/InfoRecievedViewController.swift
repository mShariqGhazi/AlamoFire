//
//  InfoRecievedViewController.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/20/21.
//

import UIKit

class InfoRecievedViewController: UIViewController {
    
    @IBOutlet weak var responseField: UILabel!
    
    var jsonResults: String = "Not Working"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        responseField.text = jsonResults
    }
    
    func sendData(){
        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
        jsonResults = sending.sendData(nameInput: "Jack Bridge", salaryInput: 67000, ageInput: 34)
    }
    
    @IBAction func retryButton(_ sender: Any) {
        sendData()
        responseField.text = jsonResults
    }
    
}
