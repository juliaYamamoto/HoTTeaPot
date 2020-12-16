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
        return CodeType.getTypeFromOrder(number: section).rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let typeNameOfSection = CodeType.getTypeFromOrder(number: section).rawValue
        let elements = statusCodeList.getAllOfType(typeNameOfSection)
        
        return elements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeNameOfSection = CodeType.getTypeFromOrder(number: indexPath.section).rawValue
        let element = statusCodeList.getAllOfType(typeNameOfSection)[indexPath.row]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(element.code) - \(element.title)"
        
        return cell
    }
}
