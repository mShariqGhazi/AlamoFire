//
//  TableViewController.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/19/21.
//

import UIKit
import Alamofire

class TableViewController: UITableViewController {
    
    @IBOutlet weak var dataTableView: UITableView!
    
    var dataArrayVariable = [DataFetched]()
    
    var employeeData: Displayable?
    
    var detailsVCPrintedJson: String = "Not Working"
    
//    var jsonString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        print(dataArrayVariable)
        
        dataTableView.dataSource = self
        
        dataTableView.refreshControl = UIRefreshControl()
        dataTableView.refreshControl?.addTarget(self, action:  #selector(refreshData), for: .valueChanged)

    }
    
    func getData() {
        let service = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
        service.fetchData()
        service.apiCompletionHandler { [weak self] (dataRecieved, status, message) in
            if status {
                guard let self = self else {return}
                guard let _data = dataRecieved else {return}
                self.dataArrayVariable = _data
                self.dataTableView.reloadData()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.dataTableView.refreshControl?.endRefreshing()
            self.dataTableView.reloadData()
        }
        
    }
    
    @objc func refreshData() {
        getData()
        dataTableView.dataSource = self
        print("refresh")
    }
    
    func sendData(){
        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
        detailsVCPrintedJson = sending.sendData(nameInput: "Jack Bridge", salaryInput: 67000, ageInput: 34)
        sending.updateData()
        sending.deleteData()
    }
    

    @IBAction func addData(_ sender: Any) {
        sendData()
//        DispatchQueue.main.async {
//            self.performSegue(withIdentifier: "InfoRecievedViewController", sender: self)
//        }
    }
    
}


extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArrayVariable.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "dataCell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "dataCell")
        }
        let data = dataArrayVariable[indexPath.row]
        
        cell?.textLabel?.text = String(data.name)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        employeeData = dataArrayVariable[indexPath.row]
        return indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InfoRecievedViewController" {
            let destViewController = segue.destination as? InfoRecievedViewController
            destViewController?.jsonResults = detailsVCPrintedJson
        }
        if segue.identifier == "DetailsViewController" {
            guard let destinationVC = segue.destination as? DetailsViewController else {
                  return
                }
            destinationVC.data = employeeData
        }
        
            
    }
}
