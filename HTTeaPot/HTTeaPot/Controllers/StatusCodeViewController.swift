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
    let navigationSearchBar = UISearchBar()
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var statusCodeTableView: UITableView!
    @IBOutlet var dataService: StatusCodeDataService!

    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statusCodeTableView.delegate = self
        self.statusCodeTableView.dataSource = dataService
        
        setupSearchBar()
        fetchStatusList()
        updateTableView(allStatusCode.statusCode)
        
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
    
    func updateTableView(_ list: [StatusCode]) {
        self.dataService.allStatusCode.statusCode = list
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
    
    
    // MARK: - Navigation Item
    
    func updateNavigationBar(showingSerch: Bool){
        if showingSerch {
            navigationItem.leftBarButtonItem = nil
            navigationItem.titleView = self.navigationSearchBar
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
            navigationItem.rightBarButtonItem?.tintColor = UIColor(named: Constants.ColorName().graySubtitle)
            navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: Constants.Font().robotoBold, size: 17)!], for: .normal)
        }
        else {
            navigationItem.rightBarButtonItem = nil
            navigationItem.titleView = nil
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
            navigationItem.leftBarButtonItem?.tintColor = UIColor(named: Constants.ColorName().grayTitle)
        }
    }
    
    @objc func searchTapped() {
        updateNavigationBar(showingSerch: true)
    }
    
    @objc func cancelTapped() {
        navigationSearchBar.text = ""
        updateTableView(allStatusCode.statusCode)
        updateNavigationBar(showingSerch: false)
    }
    

    // MARK: - SearchBar
    
    func setupSearchBar() {
        updateNavigationBar(showingSerch: false)
        
        let searchTextField = navigationSearchBar.value(forKey: Constants.SearchBar().searchFieldKey) as? UITextField
        searchTextField?.textColor = UIColor(named:Constants.ColorName().grayTitle)
        searchTextField?.font = UIFont(name: Constants.Font().robotoBold, size: 17)
        
        let searchPlaceholderLabel = searchTextField?.value(forKey: Constants.SearchBar().placeholderKey) as? UILabel
        searchPlaceholderLabel?.textColor = UIColor(named:Constants.ColorName().graySubtitle)
        navigationSearchBar.placeholder = Constants.SearchBar().placeholder
        
        navigationSearchBar.delegate = self
    }
    
    
    // MARK: - SearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            updateTableView(allStatusCode.statusCode)
        }
        
        else {
            self.filteredStatusCode = []
            
            for i in 0..<allStatusCode.statusCode.count {
                if allCodes[i].contains(searchText) || allTitles[i].contains(searchText.lowercased()) {
                    self.filteredStatusCode.append(self.allStatusCode.statusCode[i])
                }
            }
            
            updateTableView(self.filteredStatusCode)
        }
    }
}
