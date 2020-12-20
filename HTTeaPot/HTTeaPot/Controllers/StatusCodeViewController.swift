//
//  MainViewController.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import UIKit

class StatusCodeViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var allStatusCode = AllStatusCode(statusCode: [])
    
    
    // MARK: - Properties
    
    @IBOutlet weak var statusCodeTableView: UITableView!
    @IBOutlet var dataService: StatusCodeDataService!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusCodeTableView.delegate = dataService
        self.statusCodeTableView.dataSource = dataService
        
        fetchStatusList()
        updateTableView()
    }
    
    
    // MARK: - Status Code
    
    func fetchStatusList(){
        if let data = JsonParser.from(path: Constants.JSON().fileName, ofType: AllStatusCode.self) {
            allStatusCode = data
        }
    }
    
    //MARK: - Table View
    
    func updateTableView() {
        self.dataService.allStatusCode = self.allStatusCode
        self.statusCodeTableView.reloadData()
    }
}
