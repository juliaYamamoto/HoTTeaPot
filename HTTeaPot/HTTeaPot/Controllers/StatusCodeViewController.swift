//
//  MainViewController.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import UIKit

protocol ShowDetailsDelegate {
    func presentDetailsWith(_ statusCode: StatusCode)
}

class StatusCodeViewController: UIViewController, ShowDetailsDelegate {
    
    // MARK: - Properties
    
    var allStatusCode = AllStatusCode(statusCode: [])
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var statusCodeTableView: UITableView!
    @IBOutlet var dataService: StatusCodeDataService!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusCodeTableView.delegate = dataService
        self.statusCodeTableView.dataSource = dataService
        self.dataService.delegate = self
        
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
    
    
    
    //MARK: - Show Details Delegate
    func presentDetailsWith(_ statusCode: StatusCode) {
        let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        
        
        self.present(detailsVC, animated: true, completion: nil)
        detailsVC.setInformationsWith(statusCode)
    }
}
