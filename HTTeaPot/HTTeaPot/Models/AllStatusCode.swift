//
//  AllStatusCode.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-15.
//

import Foundation

struct AllStatusCode: Codable {
    
    // MARK: - Properties
    
    let statusCode: [StatusCode]
    
    
    // MARK: - Methods
    
    func getAllOfType(_ typeName: String) -> [StatusCode]{
        var typeList: [StatusCode] = []
        
        //TODO - Use FILTER
        for item in statusCode {
            if item.type == typeName {
                typeList.append(item)
            }
        }
        
        return typeList
    }
}
