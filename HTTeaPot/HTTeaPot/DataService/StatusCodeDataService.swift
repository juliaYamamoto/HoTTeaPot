//
//  StatusCodeDataService.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-18.
//

import Foundation
import UIKit

class StatusCodeDataService: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    var allStatusCode = AllStatusCode(statusCode: [])
    var sections: [String] = []
    
    func getSections(){
        var typeSet: Set<String> = []
        for item in allStatusCode.statusCode {
            typeSet.insert(item.type)
        }
        
        self.sections = typeSet.sorted()
    }
    
    // MARK: - TableView - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        getSections()
        return sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let elements = allStatusCode.getAllOfType(self.sections[section])
        return elements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell().identifier, for: indexPath) as! StatusCodeTableViewCell
        
        guard let typeNameOfSection = CodeType.getTypeFromName(sections[indexPath.section]) else {
            print("Something is wrong") //TODO - Better return
            return cell
        }
        
        let statusCode = allStatusCode.getAllOfType(typeNameOfSection.rawValue)[indexPath.row]
        cell.setupCellWith(statusCode: statusCode)
        return cell
    }
}
