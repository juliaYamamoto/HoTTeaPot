//
//  StatusCodeDataService.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-18.
//

import Foundation
import UIKit

class StatusCodeDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK: - Properties
    
    var allStatusCode = AllStatusCode(statusCode: [])
    
    
    // MARK: - TableView - Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return CodeType.count()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = CodeType.getTypeFromOrder(number: section) {
            return section.rawValue
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let sectionType = CodeType.getTypeFromOrder(number: section) else { return }
        let colorName = getColorNameForType(sectionType)
        
        if let headerView = view as? UITableViewHeaderFooterView {
            guard let textLabel = headerView.textLabel else { return }
            
            textLabel.textColor = UIColor(named: colorName)
            textLabel.font = UIFont(name: Constants.Font().robotoBold, size: 17)

        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let typeNameOfSection = CodeType.getTypeFromOrder(number: section) {
            let elements = allStatusCode.getAllOfType(typeNameOfSection.rawValue)
            return elements.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell().identifier, for: indexPath) as! StatusCodeTableViewCell
        
        guard let typeNameOfSection = CodeType.getTypeFromOrder(number: indexPath.section) else {
            print("Something is wrong") //TODO - Better return
            return cell
        }
        
        let statusCode = allStatusCode.getAllOfType(typeNameOfSection.rawValue)[indexPath.row]
        cell.setupCellWith(statusCode: statusCode)
        return cell
    }
}
