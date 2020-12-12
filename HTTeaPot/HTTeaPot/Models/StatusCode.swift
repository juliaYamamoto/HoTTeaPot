//
//  StatusCode.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-10.
//

import Foundation

enum CodeType: String{
    case informational  = "1×× informational"
    case success        = "2×× success"
    case redirection    = "3×× redirection"
    case clientError    = "4×× client error"
    case serverError    = "5×× server error"
    
    static func getTypeFromOrder(number: Int) -> CodeType {
        switch number {
        case 0:
            return CodeType.informational
        case 1:
            return CodeType.success
        case 2:
            return CodeType.redirection
        case 3:
            return CodeType.clientError
        case 4:
            return CodeType.serverError
        default:
            return CodeType.informational // TODO - improve
        }
    }
    
    static func count() -> Int {
        return 5 // TODO - improve
    }
 }

struct StatusCode: Codable {
    let code: String
    let title: String
    let description: String
    let type: String
    let source: String
}

struct AllStatusCode: Codable {
    let statusCode: [StatusCode]
    
    func getAllOfType(_ typeName: String) -> [StatusCode]{
        var typeList: [StatusCode] = []
        
        for item in statusCode {
            if item.type == typeName {
                typeList.append(item)
            }
        }
        
        return typeList
    }
}
