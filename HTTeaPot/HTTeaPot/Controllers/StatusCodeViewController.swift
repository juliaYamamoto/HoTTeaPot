//
//  MainViewController.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import UIKit

class StatusCodeViewController: UIViewController, UITableViewDelegate {
    
    // MARK: - Properties
    
    var allStatusCode = AllStatusCode(statusCode: [])
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var statusCodeTableView: UITableView!
    @IBOutlet var dataService: StatusCodeDataService!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusCodeTableView.delegate = self
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
    
    
    // MARK: - TableView - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! StatusCodeTableViewCell
        
        let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        self.present(detailsVC, animated: true, completion: nil)
        
        detailsVC.setInformationsWith(cell.statusCode)
    }
}
