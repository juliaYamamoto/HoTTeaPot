//
//  CodeType.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-15.
//

import Foundation

enum CodeType: String {
    
    // MARK: - Cases
    
    case informational  = "1xx informational"
    case success        = "2xx success"
    case redirection    = "3xx redirection"
    case clientError    = "4xx client error"
    case serverError    = "5xx server error"
    
    
    // MARK: - Methods
    
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
    
    static func getTypeFromName(_ name: String) -> CodeType {
        //TODO
        return CodeType.informational
    }
    
    static func count() -> Int {
        return 5 // TODO - improve
    }
 }
