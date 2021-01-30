//
//  MainViewController.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import UIKit

class StatusCodeViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate {
    
    // MARK: - Properties
    
    var allStatusCode = AllStatusCode(statusCode: [])
    var filteredStatusCode: [StatusCode] = []
    var allCodes: [String] = []
    var allTitles: [String] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var statusCodeTableView: UITableView!
    @IBOutlet var dataService: StatusCodeDataService!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusCodeTableView.delegate = self
        self.statusCodeTableView.dataSource = dataService
        self.searchBar.delegate = self
        
        fetchStatusList()
        updateTableView()
    }
    
    
    // MARK: - Status Code
    
    func fetchStatusList() {
        if let data = JsonParser.from(path: Constants.JSON().fileName, ofType: AllStatusCode.self) {
            allStatusCode = data
            updateListsForSearch()
        }
    }
    
    func updateListsForSearch() {
        for item in allStatusCode.statusCode {
            allCodes.append(item.code)
            allTitles.append(item.title.lowercased())
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
        
        let detailsVC = UIStoryboard(name: Constants.Identifier().mainStoryboard, bundle: nil).instantiateViewController(withIdentifier: Constants.Identifier().detailsVC) as! DetailsViewController
        self.present(detailsVC, animated: true, completion: nil)
        
        detailsVC.setInformationsWith(cell.statusCode)
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            guard let textLabel = headerView.textLabel else { return }
            guard let sectionType = CodeType.getTypeFromName(textLabel.text ?? "") else { return }
            let colorName = getColorNameForType(sectionType)

            textLabel.textColor = UIColor(named: colorName)
            textLabel.font = UIFont(name: Constants.Font().robotoBold, size: 17)
        }
    }
    
    
    // MARK: - SearchBar - Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.dataService.allStatusCode = self.allStatusCode
            self.statusCodeTableView.reloadData()
        }
        
        else {
            self.filteredStatusCode = []
            
            for i in 0..<allStatusCode.statusCode.count {
                if allCodes[i].contains(searchText) || allTitles[i].contains(searchText.lowercased()) {
                    self.filteredStatusCode.append(self.allStatusCode.statusCode[i])
                }
            }
            
            self.dataService.allStatusCode.statusCode = self.filteredStatusCode
            self.statusCodeTableView.reloadData()
        }
    }
}
