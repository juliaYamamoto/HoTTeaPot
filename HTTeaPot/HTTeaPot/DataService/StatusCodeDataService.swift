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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let typeNameOfSection = CodeType.getTypeFromOrder(number: section) {
            let elements = allStatusCode.getAllOfType(typeNameOfSection.rawValue)
            return elements.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        guard let typeNameOfSection = CodeType.getTypeFromOrder(number: indexPath.section) else {
            print("Something is wrong") //TODO - Better return
            return cell
        }

        let element = allStatusCode.getAllOfType(typeNameOfSection.rawValue)[indexPath.row]
        cell.textLabel?.text = "\(element.code) - \(element.title)"

        return cell
    }
}
