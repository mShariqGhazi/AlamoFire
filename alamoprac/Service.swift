//
//  Service.swift
//  alamoprac
//
//  Created by Shariq Ghazi on 8/16/21.
//

import Foundation
import Alamofire

class Service {
    
    typealias apiCallBack = (_ dataName:[DataFetched]?, _ status: Bool, _ message:String) -> Void
    var apiCallBack:apiCallBack?
    
    var baseUrl: String!
    
    init(urlInput: String) {
        self.baseUrl = urlInput
    }
    
    //MARK:- getAllCountryNameFrom
    func fetchData() {
        
        AF.request(baseUrl + "/employees").validate(statusCode: 200 ..< 299).responseDecodable(of: DataArray.self) { response in
            guard let fetchedData = response.data else {
                self.apiCallBack?(nil, false, "")
                return }
//            print(fetchedData)
            do {
                let decodedData = try JSONDecoder().decode(DataArray.self, from: fetchedData)
                self.apiCallBack?(decodedData.data, true, "")
            } catch {
                self.apiCallBack?(nil, false, error.localizedDescription)
                print(error)
            }
        }
        
    }
    
    func apiCompletionHandler(callBack: @escaping apiCallBack) {
        self.apiCallBack = callBack
    }
    
    func sendData(nameInput: String, salaryInput: Int, ageInput: Int) -> String {
        
        let dataParams = inputData(name: nameInput, salary: salaryInput, age: ageInput)
        
        var str: String = ""
        
        AF.request(baseUrl + "/create",
                   method: .post,
                   parameters: dataParams,
                   encoder: JSONParameterEncoder.default).responseJSON { response in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: response.data!) as? [String: Any] else {
//                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
//                    print("Error: Could print JSON in String")
                    return
                }
//                print(prettyPrintedJson)
                str = prettyPrintedJson
//                print(str)
                print(str)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
        return str
    }
    
    func updateData(empId: Int, nameInp: String, salaryInp: Int, ageInp: Int) {
        
        let dataParams = inputData(name: nameInp, salary: salaryInp, age: ageInp)
        
        AF.request(baseUrl + "/update/" + "\(empId)",
                   method: .put,
                   parameters: dataParams,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
    
    
    func deleteData(empId: Int) {
        AF.request(baseUrl + "/delete/" + "\(empId)", method: .delete).response { response in
            debugPrint(response)
        }
    }
    
}







