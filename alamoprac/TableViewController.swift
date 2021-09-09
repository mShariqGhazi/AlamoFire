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

    @IBAction func addData(_ sender: Any) {
//        let sending = Service(urlInput: "http://dummy.restapiexample.com/api/v1")
//        detailsVCPrintedJson = sending.sendData(nameInput: "Jack Bridge", salaryInput: 67000, ageInput: 34)
//        sending.updateData()
//        sending.deleteData()
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
        if segue.identifier == "DetailsViewController" {
            guard let destinationVC = segue.destination as? DetailsViewController else {
                  return
                }
            destinationVC.data = employeeData
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArrayVariable.remove(at: indexPath.row)
            dataTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}


extension TableViewController: DataAdditionsProtocol {
    
    func sendDataToStore(_ name: String, _ salary: Int, _ age: Int) {
        var temp = [DataFetched]()
        temp[0].age = age
        temp[0].name = name
        temp[0].salary = salary
        temp[0].id = dataArrayVariable.count + 1
        temp[0].img  = ""
        self.dataArrayVariable.append(temp[0])
        self.dataTableView.reloadData()
    }
    
}
