//
//  CodeType.swift
//  HTTeaPot
//
//  Created by Júlia Yamamoto on 2020-12-15.
//

import Foundation

enum CodeType: String, CaseIterable {
    
    // MARK: - Cases
    
    case informational  = "1xx informational"
    case success        = "2xx success"
    case redirection    = "3xx redirection"
    case clientError    = "4xx client error"
    case serverError    = "5xx server error"
    
    
    // MARK: - Methods
    
    static func getTypeFromOrder(number: Int) -> CodeType? {
        if number < self.count() {
            return CodeType.allCases[number]
        }
        return nil
    }
    
    static func getTypeFromName(_ name: String) -> CodeType? {
        if let type = CodeType(rawValue: name) {
            return type
        }
        return nil
    }
    
    static func count() -> Int {
        return CodeType.allCases.count
    }
 }
