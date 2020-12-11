//
//  MainViewController.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import UIKit

class MainViewController: UITableViewController  {
    
//    #warning("TODO: replace with data from the status code json")
//    var data : [CodeType:[StatusCode]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        createTemporaryValues()
        var newData = buildStatusCodeList()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func buildStatusCodeList() -> AllStatusCode?{
        
        var aData = JsonParser.from(path: Constants.JSON().fileName, ofType: AllStatusCode.self)
        return aData
        
        
//        let aData = JsonParser.from(path: Constants.JSON().fileName, ofType: AllStatusCode)
//
//        if let fetchedData = fetchData() {
//            if let newData = parseData(jsonData: fetchedData) {
//                print(newData.statusCode)
//            }
//        }
//
//        return nil
    }
    
        func fetchData() -> Data? {
            do {
                if let path = Bundle.main.path(forResource: Constants.JSON().fileName, ofType: "json") {
                   let jsonData = try String(contentsOfFile: path).data(using: .utf8)
                    return jsonData
                }
            } catch {
                print(error)
            }
            
            return nil
        }
    
    func parseData(jsonData: Data) -> AllStatusCode?{
        do {
            let decodedData = try JSONDecoder().decode(AllStatusCode.self, from: jsonData)
            return decodedData
        } catch {
            print(error)
        }
        
        return nil
    }
    
//    func createTemporaryValues(){
//        let aa = StatusCode(code: "100", title: "continue", description: "...", type: .informational, source: "...")
//        let ab = StatusCode(code: "101", title: "switching protocols", description: "...", type: .informational, source: "...")
//        let ac = StatusCode(code: "102", title: "processing", description: "...", type: .informational, source: "...")
//        let ba = StatusCode(code: "200", title: "continue", description: "...", type: .success, source: "...")
//        let bb = StatusCode(code: "201", title: "created", description: "...", type: .success, source: "...")
//        let bc = StatusCode(code: "202", title: "accepted", description: "...", type: .success, source: "...")
//        let ca = StatusCode(code: "300", title: "multiple choices", description: "...", type: .redirection, source: "...")
//        let da = StatusCode(code: "400", title: "bad request", description: "...", type: .clientError, source: "...")
//        let db = StatusCode(code: "418", title: "I'm a teapot", description: "...", type: .clientError, source: "...")
//        let ea = StatusCode(code: "500", title: "internal server error", description: "...", type: .serverError, source: "...")
//
//        data = [.informational : [aa, ab, ac], .success : [ba, bb, bc], .redirection : [ca], .clientError : [da, db], .serverError : [ea]]
//    }

    override func numberOfSections(in tableView: UITableView) -> Int {
//        return data.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String = ""
        
//        switch section {
//        case 0: title = CodeType.informational.rawValue
//        case 1: title = CodeType.success.rawValue
//        case 2: title = CodeType.redirection.rawValue
//        case 3: title = CodeType.clientError.rawValue
//        case 4: title = CodeType.serverError.rawValue
//        default: title = "default" }
        
        return title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var codeArray: [StatusCode]?
//
//        switch section {
//        case 0: codeArray = data[CodeType.informational]
//        case 1: codeArray = data[CodeType.success]
//        case 2: codeArray = data[CodeType.redirection]
//        case 3: codeArray = data[CodeType.clientError]
//        case 4: codeArray = data[CodeType.serverError]
//        default: codeArray = nil }
//
//        if let elements = codeArray {
//            return elements.count
//        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
//        var codeArray: [StatusCode]?
//
//        switch indexPath.section {
//        case 0: codeArray = data[CodeType.informational]
//        case 1: codeArray = data[CodeType.success]
//        case 2: codeArray = data[CodeType.redirection]
//        case 3: codeArray = data[CodeType.clientError]
//        case 4: codeArray = data[CodeType.serverError]
//        default: codeArray = nil }
        
//        if let elements = codeArray {
//            cell.textLabel?.text = "\(elements[indexPath.row].code) \(elements[indexPath.row].title)"
//        }
        
        return cell
    }
}
