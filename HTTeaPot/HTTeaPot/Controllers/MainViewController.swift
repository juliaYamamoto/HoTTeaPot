//
//  MainViewController.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import UIKit

class MainViewController: UITableViewController  {
    
    
    // MARK: - Properties
    
    var statusCodeList = AllStatusCode(statusCode: [])
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        fetchStatusList()
    }
    
    
    // MARK: - Status Code
    
    func fetchStatusList(){
        if let data = JsonParser.from(path: Constants.JSON().fileName, ofType: AllStatusCode.self) {
            statusCodeList = data
        }
    }

    
    // MARK: - UITableViewController
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return CodeType.count()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = CodeType.getTypeFromOrder(number: section) {
            return section.rawValue
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let typeNameOfSection = CodeType.getTypeFromOrder(number: section) {
            let elements = statusCodeList.getAllOfType(typeNameOfSection.rawValue)
            return elements.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        guard let typeNameOfSection = CodeType.getTypeFromOrder(number: indexPath.section) else {
            print("Something is wrong") //TODO - Better return
            return cell
        }
        
        let element = statusCodeList.getAllOfType(typeNameOfSection.rawValue)[indexPath.row]
        cell.textLabel?.text = "\(element.code) - \(element.title)"
        
        return cell
    }
}
