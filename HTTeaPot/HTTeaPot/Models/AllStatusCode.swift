//
//  AllStatusCode.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-15.
//

import Foundation

struct AllStatusCode: Codable {
    
    // MARK: - Properties
    
    var statusCode: [StatusCode]
    
    
    // MARK: - Methods
    
    func getAllOfType(_ typeName: String) -> [StatusCode]{
        let typeList = statusCode.filter({ return $0.type == typeName})
        return typeList
    }
}
